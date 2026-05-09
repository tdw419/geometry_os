; DESCRIPTION: Places a purple 102x53 rectangle at position (294, 117).
; PLAN: r0=294(x), r1=117(y), r2=102(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 117
LDI r2, 102
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
