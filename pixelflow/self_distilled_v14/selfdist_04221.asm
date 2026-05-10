; DESCRIPTION: Creates a white filled rectangle of size 63x46 starting at (309, 127).
; PLAN: r0=309(x), r1=127(y), r2=63(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 127
LDI r2, 63
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
