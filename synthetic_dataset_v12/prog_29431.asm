; DESCRIPTION: Renders a purple box of size 30x21 starting at (392, 174).
; PLAN: r0=392(x), r1=174(y), r2=30(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 174
LDI r2, 30
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
