; 044_starfield_v3.asm -- Starfield with white dots of varying brightness
; Dark background with ~80 scattered stars in 5 brightness levels

; Fill background: near-black dark blue
LDI r0, 0x020208
FILL r0

; Brightness level 1: dim stars 0x222222
LDI r1, 10
LDI r2, 20
LDI r3, 0x222222
PSET r1, r2, r3
LDI r1, 45
LDI r2, 8
PSET r1, r2, r3
LDI r1, 78
LDI r2, 230
PSET r1, r2, r3
LDI r1, 130
LDI r2, 15
PSET r1, r2, r3
LDI r1, 190
LDI r2, 240
PSET r1, r2, r3
LDI r1, 240
LDI r2, 100
PSET r1, r2, r3
LDI r1, 5
LDI r2, 150
PSET r1, r2, r3
LDI r1, 170
LDI r2, 45
PSET r1, r2, r3
LDI r1, 210
LDI r2, 210
PSET r1, r2, r3
LDI r1, 95
LDI r2, 120
PSET r1, r2, r3
LDI r1, 250
LDI r2, 30
PSET r1, r2, r3
LDI r1, 55
LDI r2, 200
PSET r1, r2, r3
LDI r1, 145
LDI r2, 180
PSET r1, r2, r3
LDI r1, 30
LDI r2, 90
PSET r1, r2, r3
LDI r1, 200
LDI r2, 145
PSET r1, r2, r3
LDI r1, 115
LDI r2, 250
PSET r1, r2, r3

; Brightness level 2: 0x555555
LDI r3, 0x555555
LDI r1, 25
LDI r2, 50
PSET r1, r2, r3
LDI r1, 70
LDI r2, 35
PSET r1, r2, r3
LDI r1, 110
LDI r2, 95
PSET r1, r2, r3
LDI r1, 155
LDI r2, 70
PSET r1, r2, r3
LDI r1, 220
LDI r2, 180
PSET r1, r2, r3
LDI r1, 15
LDI r2, 210
PSET r1, r2, r3
LDI r1, 180
LDI r2, 10
PSET r1, r2, r3
LDI r1, 88
LDI r2, 160
PSET r1, r2, r3
LDI r1, 245
LDI r2, 65
PSET r1, r2, r3
LDI r1, 135
LDI r2, 200
PSET r1, r2, r3
LDI r1, 40
LDI r2, 130
PSET r1, r2, r3
LDI r1, 200
LDI r2, 80
PSET r1, r2, r3
LDI r1, 160
LDI r2, 240
PSET r1, r2, r3

; Brightness level 3: 0x888888
LDI r3, 0x888888
LDI r1, 50
LDI r2, 75
PSET r1, r2, r3
LDI r1, 120
LDI r2, 40
PSET r1, r2, r3
LDI r1, 185
LDI r2, 130
PSET r1, r2, r3
LDI r1, 35
LDI r2, 170
PSET r1, r2, r3
LDI r1, 230
LDI r2, 50
PSET r1, r2, r3
LDI r1, 100
LDI r2, 210
PSET r1, r2, r3
LDI r1, 170
LDI r2, 90
PSET r1, r2, r3
LDI r1, 75
LDI r2, 245
PSET r1, r2, r3
LDI r1, 215
LDI r2, 220
PSET r1, r2, r3
LDI r1, 8
LDI r2, 55
PSET r1, r2, r3
LDI r1, 140
LDI r2, 150
PSET r1, r2, r3

; Brightness level 4: 0xBBBBBB
LDI r3, 0xBBBBBB
LDI r1, 60
LDI r2, 25
PSET r1, r2, r3
LDI r1, 128
LDI r2, 128
PSET r1, r2, r3
LDI r1, 195
LDI r2, 200
PSET r1, r2, r3
LDI r1, 20
LDI r2, 110
PSET r1, r2, r3
LDI r1, 240
LDI r2, 150
PSET r1, r2, r3
LDI r1, 85
LDI r2, 50
PSET r1, r2, r3
LDI r1, 160
LDI r2, 15
PSET r1, r2, r3
LDI r1, 105
LDI r2, 175
PSET r1, r2, r3

; Brightness level 5: bright white 0xFFFFFF
LDI r3, 0xFFFFFF
LDI r1, 40
LDI r2, 10
PSET r1, r2, r3
LDI r1, 150
LDI r2, 60
PSET r1, r2, r3
LDI r1, 90
LDI r2, 100
PSET r1, r2, r3
LDI r1, 210
LDI r2, 30
PSET r1, r2, r3
LDI r1, 30
LDI r2, 190
PSET r1, r2, r3
LDI r1, 180
LDI r2, 170
PSET r1, r2, r3
LDI r1, 120
LDI r2, 230
PSET r1, r2, r3
LDI r1, 235
LDI r2, 120
PSET r1, r2, r3

HALT
