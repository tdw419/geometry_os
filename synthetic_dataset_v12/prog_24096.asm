; DESCRIPTION: Composite: Renders a cyan disk with center (394, 133) and radius 53 then Renders a green box of size 99x30 starting at (330, 101).
; PLAN: r0=394(x), r1=133(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x), r6=101(y), r7=99(width), r8=30(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 133
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 101
LDI r7, 99
LDI r8, 30
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
