; DESCRIPTION: Renders a cyan box of size 65x38 starting at (70, 178).
; PLAN: r0=70(x), r1=178(y), r2=65(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 178
LDI r2, 65
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
