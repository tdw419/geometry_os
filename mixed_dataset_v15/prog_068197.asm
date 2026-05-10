; DESCRIPTION: Places a orange 10x99 rectangle at position (243, 113).
; PLAN: r0=243(x), r1=113(y), r2=10(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 113
LDI r2, 10
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
