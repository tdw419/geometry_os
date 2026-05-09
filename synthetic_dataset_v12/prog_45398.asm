; DESCRIPTION: Places a cyan 28x41 rectangle at position (284, 35).
; PLAN: r0=284(x), r1=35(y), r2=28(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 35
LDI r2, 28
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
