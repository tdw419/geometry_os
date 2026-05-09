; DESCRIPTION: Creates a cyan rectangular region at (103, 184) spanning 93 by 68 pixels.
; PLAN: r0=103(x), r1=184(y), r2=93(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 184
LDI r2, 93
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
