; DESCRIPTION: Places a black 33x103 rectangle at position (410, 59).
; PLAN: r0=410(x), r1=59(y), r2=33(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 59
LDI r2, 33
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
