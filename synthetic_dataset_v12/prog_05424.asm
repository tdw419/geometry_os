; DESCRIPTION: Renders a red box of size 72x84 starting at (187, 164).
; PLAN: r0=187(x), r1=164(y), r2=72(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 164
LDI r2, 72
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
