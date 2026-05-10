; DESCRIPTION: Renders a cyan box of size 102x84 starting at (398, 87).
; PLAN: r0=398(x), r1=87(y), r2=102(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 87
LDI r2, 102
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
