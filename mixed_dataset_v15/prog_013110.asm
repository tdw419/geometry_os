; DESCRIPTION: Creates a cyan filled rectangle of size 55x17 starting at (394, 93).
; PLAN: r0=394(x), r1=93(y), r2=55(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 93
LDI r2, 55
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
