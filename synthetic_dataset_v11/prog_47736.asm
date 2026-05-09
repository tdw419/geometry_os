; DESCRIPTION: Creates a red rectangular region at (101, 164) spanning 48 by 42 pixels.
; PLAN: r0=101(x), r1=164(y), r2=48(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 164
LDI r2, 48
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
