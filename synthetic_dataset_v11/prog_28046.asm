; DESCRIPTION: Composite: . Then Renders a cyan box of size 85x30 starting at (8, 22). Then Renders a cyan line between points (193, 159) and (56, 193).
; PLAN: r0=8(x), r1=22(y), r2=85(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=193(x1), r1=159(y1), r2=56(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 85x30 starting at (8, 22).
; PLAN: r0=8(x), r1=22(y), r2=85(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 22
LDI r2, 85
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (193, 159) and (56, 193).
; PLAN: r0=193(x1), r1=159(y1), r2=56(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 159
LDI r2, 56
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
