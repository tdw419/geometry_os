; DESCRIPTION: Renders a yellow box of size 87x97 starting at (294, 86).
; PLAN: r0=294(x), r1=86(y), r2=87(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 86
LDI r2, 87
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
