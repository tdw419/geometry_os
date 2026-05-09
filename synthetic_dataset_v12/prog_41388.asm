; DESCRIPTION: Creates a cyan rectangular region at (102, 163) spanning 93 by 64 pixels.
; PLAN: r0=102(x), r1=163(y), r2=93(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 163
LDI r2, 93
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
