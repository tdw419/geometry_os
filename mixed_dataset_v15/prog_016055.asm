; DESCRIPTION: Composite: Renders a purple line between points (365, 135) and (120, 243) then Renders a cyan box of size 106x21 starting at (382, 57).
; PLAN: r0=365(x1), r1=135(y1), r2=120(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=57(y), r7=106(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 135
LDI r2, 120
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 57
LDI r7, 106
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
