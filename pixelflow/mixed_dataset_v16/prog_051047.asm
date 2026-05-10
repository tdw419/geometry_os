; DESCRIPTION: Renders a purple box of size 67x11 starting at (224, 215).
; PLAN: r0=224(x), r1=215(y), r2=67(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 215
LDI r2, 67
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
