; DESCRIPTION: Renders a orange box of size 81x42 starting at (113, 143).
; PLAN: r0=113(x), r1=143(y), r2=81(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 143
LDI r2, 81
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
