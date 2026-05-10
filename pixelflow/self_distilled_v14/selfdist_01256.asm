; DESCRIPTION: Renders a blue rectangular region spanning 56 by 32 at (294, 192).
; PLAN: r0=294(x), r1=192(y), r2=56(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 192
LDI r2, 56
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
