; DESCRIPTION: Places a orange 111x29 rectangle at position (398, 216).
; PLAN: r0=398(x), r1=216(y), r2=111(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 216
LDI r2, 111
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
