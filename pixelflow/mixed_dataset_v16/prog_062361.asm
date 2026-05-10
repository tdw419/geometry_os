; DESCRIPTION: Renders a green box of size 33x73 starting at (429, 125).
; PLAN: r0=429(x), r1=125(y), r2=33(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 125
LDI r2, 33
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
