; STARFIELD -- White dots of varying brightness on dark blue-black sky
; Simulates a night sky with stars at different positions and brightnesses

; Dark sky background
LDI r0, 0x050510
FILL r0

; Bright stars (near white)
LDI r0, 20   LDI r1, 15   LDI r2, 0xDDDDFF   PSET r0, r1, r2
LDI r0, 180  LDI r1, 40   LDI r2, 0xEEEEFF   PSET r0, r1, r2
LDI r0, 95   LDI r1, 70   LDI r2, 0xFFFFEE   PSET r0, r1, r2
LDI r0, 240  LDI r1, 90   LDI r2, 0xDDDDFF   PSET r0, r1, r2
LDI r0, 55   LDI r1, 130  LDI r2, 0xEEEEFF   PSET r0, r1, r2
LDI r0, 150  LDI r1, 160  LDI r2, 0xFFFFDD   PSET r0, r1, r2
LDI r0, 210  LDI r1, 200  LDI r2, 0xDDDDFF   PSET r0, r1, r2
LDI r0, 30   LDI r1, 230  LDI r2, 0xEEEEFF   PSET r0, r1, r2
LDI r0, 130  LDI r1, 250  LDI r2, 0xFFFFEE   PSET r0, r1, r2
LDI r0, 75   LDI r1, 50   LDI r2, 0xFFFFFF   PSET r0, r1, r2

; Medium stars
LDI r0, 45   LDI r1, 25   LDI r2, 0x9999BB   PSET r0, r1, r2
LDI r0, 200  LDI r1, 55   LDI r2, 0x8888AA   PSET r0, r1, r2
LDI r0, 120  LDI r1, 95   LDI r2, 0x9999BB   PSET r0, r1, r2
LDI r0, 15   LDI r1, 110  LDI r2, 0x8888AA   PSET r0, r1, r2
LDI r0, 230  LDI r1, 130  LDI r2, 0x9999BB   PSET r0, r1, r2
LDI r0, 85   LDI r1, 175  LDI r2, 0x8888AA   PSET r0, r1, r2
LDI r0, 170  LDI r1, 220  LDI r2, 0x9999BB   PSET r0, r1, r2
LDI r0, 250  LDI r1, 240  LDI r2, 0x8888AA   PSET r0, r1, r2
LDI r0, 60   LDI r1, 200  LDI r2, 0x9999BB   PSET r0, r1, r2
LDI r0, 190  LDI r1, 15   LDI r2, 0x8888AA   PSET r0, r1, r2

; Dim stars
LDI r0, 110  LDI r1, 30   LDI r2, 0x555566   PSET r0, r1, r2
LDI r0, 35   LDI r1, 80   LDI r2, 0x444455   PSET r0, r1, r2
LDI r0, 250  LDI r1, 60   LDI r2, 0x555566   PSET r0, r1, r2
LDI r0, 160  LDI r1, 105  LDI r2, 0x444455   PSET r0, r1, r2
LDI r0, 70   LDI r1, 150  LDI r2, 0x555566   PSET r0, r1, r2
LDI r0, 220  LDI r1, 170  LDI r2, 0x444455   PSET r0, r1, r2
LDI r0, 10   LDI r1, 195  LDI r2, 0x555566   PSET r0, r1, r2
LDI r0, 140  LDI r1, 235  LDI r2, 0x444455   PSET r0, r1, r2
LDI r0, 245  LDI r1, 15   LDI r2, 0x555566   PSET r0, r1, r2
LDI r0, 100  LDI r1, 145  LDI r2, 0x444455   PSET r0, r1, r2

; Very dim stars
LDI r0, 5    LDI r1, 5    LDI r2, 0x333344   PSET r0, r1, r2
LDI r0, 135  LDI r1, 55   LDI r2, 0x222233   PSET r0, r1, r2
LDI r0, 215  LDI r1, 85   LDI r2, 0x333344   PSET r0, r1, r2
LDI r0, 50   LDI r1, 115  LDI r2, 0x222233   PSET r0, r1, r2
LDI r0, 175  LDI r1, 155  LDI r2, 0x333344   PSET r0, r1, r2
LDI r0, 25   LDI r1, 185  LDI r2, 0x222233   PSET r0, r1, r2
LDI r0, 195  LDI r1, 245  LDI r2, 0x333344   PSET r0, r1, r2
LDI r0, 80   LDI r1, 215  LDI r2, 0x222233   PSET r0, r1, r2
LDI r0, 155  LDI r1, 10   LDI r2, 0x333344   PSET r0, r1, r2
LDI r0, 235  LDI r1, 115  LDI r2, 0x222233   PSET r0, r1, r2

HALT
