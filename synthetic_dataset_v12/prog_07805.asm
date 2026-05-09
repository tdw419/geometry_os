; DESCRIPTION: Renders a purple box of size 96x42 starting at (70, 152).
; PLAN: r0=70(x), r1=152(y), r2=96(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 152
LDI r2, 96
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
