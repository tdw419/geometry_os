; DESCRIPTION: Renders a magenta box of size 55x42 starting at (372, 176).
; PLAN: r0=372(x), r1=176(y), r2=55(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 176
LDI r2, 55
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
