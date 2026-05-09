; DESCRIPTION: Places a cyan 27x113 rectangle at position (121, 13).
; PLAN: r0=121(x), r1=13(y), r2=27(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 13
LDI r2, 27
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
