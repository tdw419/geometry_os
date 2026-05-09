; DESCRIPTION: Renders a blue box of size 120x42 starting at (90, 160).
; PLAN: r0=90(x), r1=160(y), r2=120(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 160
LDI r2, 120
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
