; DESCRIPTION: Renders a orange box of size 73x47 starting at (363, 42).
; PLAN: r0=363(x), r1=42(y), r2=73(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 42
LDI r2, 73
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
