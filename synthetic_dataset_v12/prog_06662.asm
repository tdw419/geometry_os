; DESCRIPTION: Renders a cyan box of size 117x21 starting at (23, 29).
; PLAN: r0=23(x), r1=29(y), r2=117(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 29
LDI r2, 117
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
