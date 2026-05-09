; DESCRIPTION: Renders a cyan box of size 13x107 starting at (59, 70).
; PLAN: r0=59(x), r1=70(y), r2=13(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 70
LDI r2, 13
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
