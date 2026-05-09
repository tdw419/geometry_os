; DESCRIPTION: Renders a cyan box of size 20x59 starting at (70, 142).
; PLAN: r0=70(x), r1=142(y), r2=20(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 142
LDI r2, 20
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
