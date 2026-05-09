; DESCRIPTION: Renders a purple box of size 113x42 starting at (69, 172).
; PLAN: r0=69(x), r1=172(y), r2=113(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 172
LDI r2, 113
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
