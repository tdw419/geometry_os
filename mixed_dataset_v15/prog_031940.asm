; DESCRIPTION: Renders a cyan box of size 82x84 starting at (410, 70).
; PLAN: r0=410(x), r1=70(y), r2=82(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 70
LDI r2, 82
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
