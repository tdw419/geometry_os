; DESCRIPTION: Places a orange 39x99 rectangle at position (327, 127).
; PLAN: r0=327(x), r1=127(y), r2=39(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 127
LDI r2, 39
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
