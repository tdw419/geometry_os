; DESCRIPTION: Composite: Places a cyan 92x33 rectangle at position (107, 117) then Renders a cyan line between points (362, 60) and (487, 184).
; PLAN: r0=107(x), r1=117(y), r2=92(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x1), r6=60(y1), r7=487(x2), r8=184(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 117
LDI r2, 92
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 60
LDI r7, 487
LDI r8, 184
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
