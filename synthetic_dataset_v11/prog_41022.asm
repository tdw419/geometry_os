; DESCRIPTION: Composite: . Then Renders a white line between points (36, 104) and (249, 89). Then Places a cyan 24x111 rectangle at position (143, 132).
; PLAN: r0=36(x1), r1=104(y1), r2=249(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=143(x), r1=132(y), r2=24(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white line between points (36, 104) and (249, 89).
; PLAN: r0=36(x1), r1=104(y1), r2=249(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 104
LDI r2, 249
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan 24x111 rectangle at position (143, 132).
; PLAN: r0=143(x), r1=132(y), r2=24(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 132
LDI r2, 24
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
