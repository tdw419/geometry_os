; DESCRIPTION: Composite: . Then Renders a cyan box of size 92x118 starting at (135, 27). Then Renders a blue line between points (104, 110) and (179, 128).
; PLAN: r0=135(x), r1=27(y), r2=92(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=104(x1), r1=110(y1), r2=179(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 92x118 starting at (135, 27).
; PLAN: r0=135(x), r1=27(y), r2=92(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 27
LDI r2, 92
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue line between points (104, 110) and (179, 128).
; PLAN: r0=104(x1), r1=110(y1), r2=179(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 110
LDI r2, 179
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
