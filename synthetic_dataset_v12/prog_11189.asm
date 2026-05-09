; DESCRIPTION: Creates a red rectangular region at (21, 146) spanning 26 by 50 pixels.
; PLAN: r0=21(x), r1=146(y), r2=26(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 146
LDI r2, 26
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
