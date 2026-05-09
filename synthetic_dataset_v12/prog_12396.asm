; DESCRIPTION: Creates a cyan rectangular region at (159, 61) spanning 100 by 120 pixels.
; PLAN: r0=159(x), r1=61(y), r2=100(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 61
LDI r2, 100
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
