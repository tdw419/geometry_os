; DESCRIPTION: Renders a cyan box of size 53x70 starting at (334, 59).
; PLAN: r0=334(x), r1=59(y), r2=53(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 59
LDI r2, 53
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
