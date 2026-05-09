; DESCRIPTION: Renders a orange box of size 120x42 starting at (175, 207).
; PLAN: r0=175(x), r1=207(y), r2=120(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 207
LDI r2, 120
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
