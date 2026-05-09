; DESCRIPTION: Places a purple 27x55 rectangle at position (229, 170).
; PLAN: r0=229(x), r1=170(y), r2=27(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 170
LDI r2, 27
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
