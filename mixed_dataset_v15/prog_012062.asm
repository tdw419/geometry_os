; DESCRIPTION: Composite: Renders a green disk with center (78, 210) and radius 38 then Places a purple dot at position (413, 245) then Places a cyan 42x41 rectangle at position (301, 112).
; PLAN: r0=78(x), r1=210(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=413(x), r6=245(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=301(x), r11=112(y), r12=42(width), r13=41(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 210
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 413
LDI r6, 245
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 301
LDI r11, 112
LDI r12, 42
LDI r13, 41
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
