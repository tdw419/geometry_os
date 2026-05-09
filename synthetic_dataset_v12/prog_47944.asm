; DESCRIPTION: Places a red 16x11 rectangle at position (485, 154).
; PLAN: r0=485(x), r1=154(y), r2=16(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 154
LDI r2, 16
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
