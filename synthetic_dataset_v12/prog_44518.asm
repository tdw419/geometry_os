; DESCRIPTION: Creates a red rectangular region at (405, 154) spanning 95 by 55 pixels.
; PLAN: r0=405(x), r1=154(y), r2=95(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 154
LDI r2, 95
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
