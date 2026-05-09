; DESCRIPTION: Places a yellow 16x27 rectangle at position (202, 178).
; PLAN: r0=202(x), r1=178(y), r2=16(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 178
LDI r2, 16
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
