; DESCRIPTION: Renders a cyan box of size 21x35 starting at (135, 152).
; PLAN: r0=135(x), r1=152(y), r2=21(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 152
LDI r2, 21
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
