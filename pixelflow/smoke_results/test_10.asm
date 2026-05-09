; DESCRIPTION: Fills the screen with a vertical gradient from black to white.
; PLAN: r0=CMP flag (49(x), r1=106(y), r2=0(width), r3=512(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 181
LDI r2, 20
LDI r3, 0x000000
RECTF r0, r1, r2, r3, r4
HALT