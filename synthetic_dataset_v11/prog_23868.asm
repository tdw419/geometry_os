; DESCRIPTION: Composite: . Then Places a green dot at position (132, 38). Then Places a white 114x68 rectangle at position (140, 24).
; PLAN: r0=132(x), r1=38(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=140(x), r1=24(y), r2=114(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (132, 38).
; PLAN: r0=132(x), r1=38(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 38
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a white 114x68 rectangle at position (140, 24).
; PLAN: r0=140(x), r1=24(y), r2=114(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 24
LDI r2, 114
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
