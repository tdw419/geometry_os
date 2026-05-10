; DESCRIPTION: Creates a red rectangular region at (120, 33) spanning 105 by 42 pixels.
; PLAN: r0=120(x), r1=33(y), r2=105(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 33
LDI r2, 105
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
