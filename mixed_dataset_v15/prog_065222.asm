; DESCRIPTION: Renders a green box of size 39x13 starting at (429, 186).
; PLAN: r0=429(x), r1=186(y), r2=39(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 186
LDI r2, 39
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
