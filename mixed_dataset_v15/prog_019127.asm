; DESCRIPTION: Composite: Renders a red box of size 46x52 starting at (1, 3) then Sets a single cyan pixel at (220, 164).
; PLAN: r0=1(x), r1=3(y), r2=46(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x), r6=164(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 1
LDI r1, 3
LDI r2, 46
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 164
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
