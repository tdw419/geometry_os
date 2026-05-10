; DESCRIPTION: Creates a cyan rectangular region at (42, 95) spanning 91 by 98 pixels.
; PLAN: r0=42(x), r1=95(y), r2=91(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 95
LDI r2, 91
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
