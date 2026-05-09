; DESCRIPTION: Renders a cyan box of size 21x59 starting at (21, 124).
; PLAN: r0=21(x), r1=124(y), r2=21(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 124
LDI r2, 21
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
