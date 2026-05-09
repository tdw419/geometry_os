; DESCRIPTION: Creates a cyan rectangular region at (449, 59) spanning 49 by 91 pixels.
; PLAN: r0=449(x), r1=59(y), r2=49(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 59
LDI r2, 49
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
