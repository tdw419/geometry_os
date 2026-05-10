; DESCRIPTION: Renders a green box of size 39x98 starting at (418, 86).
; PLAN: r0=418(x), r1=86(y), r2=39(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 86
LDI r2, 39
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
