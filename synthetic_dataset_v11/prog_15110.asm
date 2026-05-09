; DESCRIPTION: Creates a cyan rectangular region at (168, 107) spanning 23 by 62 pixels.
; PLAN: r0=168(x), r1=107(y), r2=23(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 107
LDI r2, 23
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
